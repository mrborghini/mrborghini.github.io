class ToDo extends InputValidation {
    todo;
    done;
    id;
    #logger;

    constructor() {
        super();
        this.todo = JSON.parse(localStorage.getItem('todos')) || [];
        this.id = JSON.parse(localStorage.getItem('ids')) || [];
        this.done = JSON.parse(localStorage.getItem('done')) || [];
        this.#logger = new Logger("ToDo");
    }

    addToDo() {
        const verify = this.verifyAddToDo();
        if (verify !== "") {
            this.todo.push(verify);
            this.done.push(false);
            this.id.push(this.id.length + 1);
            this.updateLocalStorage();
            this.updateList();
            this.#logger.info(`Added ${verify}`);
        } else {
            this.#logger.error("Nothing was added");
        }
    }

    removeAllTodos() {
        localStorage.clear();
        this.todo = [];
        this.id = [];
        this.done = [];
        this.updateList();
        this.#logger.info("WHYYYY");
    }

    removeSpecific(id) {
        const index = this.id.indexOf(id);
        if (index !== -1) {
            this.todo.splice(index, 1);
            this.done.splice(index, 1);
            this.updateLocalStorage();
            this.updateList();
            this.#logger.info("Gone, reduced to atoms");
        }
    }

    toggleCheck(id) {
        const index = this.id.indexOf(id);
        if (index !== -1) {
            this.done[index] = !this.done[index];
            this.updateLocalStorage();
            this.updateList();
            this.#logger.info("Wow you changed me :/");
        }
    }

    editMode(id) {
        const p = document.getElementById(`p-${id}`);

        const editbutton = document.getElementById(`edit-${id}`);

        const savebutton = document.createElement("button");
        savebutton.setAttribute("id", `save-${id}`);
        savebutton.setAttribute("onclick", `todo.saveButton(${id})`);
        savebutton.innerText = "💾";


        const input = document.createElement("input");
        input.setAttribute("id", `inputedit-${id}`);
        input.value = this.todo[id - 1];

        editbutton.parentNode.replaceChild(savebutton, editbutton);
        p.parentNode.replaceChild(input, p);
    }

    saveButton(id) {
        const verify = this.verifyEditTodo(id);

        if (verify !== "") {
            this.editSpecific(id, verify);

            const savebutton = document.getElementById(`save-${id}`);
            const input = document.getElementById(`inputedit-${id}`);

            const stringtodo = document.createElement("p");
            stringtodo.setAttribute("id", `p-${id}`);
            stringtodo.innerText = verify;

            const edit = document.createElement("button");
            edit.innerText = "✏";
            edit.setAttribute("onclick", `todo.editMode(${id});`);
            edit.setAttribute("id", `edit-${id}`);

            input.parentNode.replaceChild(stringtodo, input);
            savebutton.parentNode.replaceChild(edit, savebutton);
        }
    }

    editSpecific(id, text) {
        this.todo[id - 1] = text;
        this.#logger.debug(this.todo[id - 1]);
        this.updateLocalStorage();
        this.#logger.info(`Successfully edited To Do: ${this.todo[id - 1]}`);
    }

    updateLocalStorage() {
        localStorage.setItem('todos', JSON.stringify(this.todo));
        localStorage.setItem('ids', JSON.stringify(this.id));
        localStorage.setItem('done', JSON.stringify(this.done));
    }

    updateList() {
        const allTodos = document.getElementsByClassName("allTodos")[0];
        if (allTodos) {
            allTodos.remove();
            this.showToDo();
        }
    }

    showToDo() {
        const allTodos = document.createElement("div");
        allTodos.classList.add("allTodos");
        document.body.appendChild(allTodos);


        for (let i = 0; i < this.todo.length; i++) {
            const todos = document.createElement("div");
            todos.classList.add("todos");
            todos.classList.add(`p-${this.id[i]};`);


            const done = document.createElement("button");
            done.innerText = "O";
            done.setAttribute("onclick", `todo.toggleCheck(${this.id[i]});`);

            const remove = document.createElement("button");
            remove.innerText = "♻";
            remove.setAttribute("onclick", `todo.removeSpecific(${this.id[i]});`);

            const edit = document.createElement("button");
            edit.innerText = "✏";
            edit.setAttribute("onclick", `todo.editMode(${this.id[i]});`);
            edit.setAttribute("id", `edit-${this.id[i]}`);

            const stringtodo = document.createElement("p");
            stringtodo.setAttribute("id", `p-${this.id[i]}`);
            stringtodo.innerText = this.todo[i];

            stringtodo.classList.add("notdone");
            remove.classList.add("notdone");
            edit.classList.add("notdone");
            done.classList.add("notdone");

            if (this.done[i]) {
                stringtodo.removeAttribute("class");
                remove.removeAttribute("class");
                edit.removeAttribute("class");
                done.removeAttribute("class");

                done.innerText = "✓";
                stringtodo.classList.add("done");
                remove.classList.add("doneyes");
                edit.classList.add("doneyes");
                done.classList.add("doneyes");
            }
            allTodos.appendChild(todos);

            todos.appendChild(remove);
            todos.appendChild(edit);
            todos.appendChild(done);
            todos.appendChild(stringtodo);
        }
    }
}