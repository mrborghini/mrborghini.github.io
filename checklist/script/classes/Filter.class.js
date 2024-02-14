class Filter {
    #logger;
    todo;

    constructor(todo) {
        this.#logger = new Logger("Filter");
        this.todo = todo;
    }

    getFilter() {
        const input = document.getElementById("filter").value;
        this.#logger.debug(input);

        switch (parseInt(input)) {
            case 1:
                this.showChecked();
                this.#logger.info("NOO YOU CAN'T MAKE ME HIDE FROM YOU (filtering checked)");
                break;
            case 2:
                this.showUnchecked();
                this.#logger.info("filtering unchecked :/");
                break;
            default:
                this.#logger.info("Showing all");
                todo.updateList();
                break;
        }
    }

    showUnchecked() {
        todo.updateList();
        const checked = document.getElementsByClassName("done");
        const checkedbuttons = document.getElementsByClassName("doneyes");

        for (let i = checked.length - 1; i >= 0; i--) {
            checked[i].remove();
        }

        for (let x = checkedbuttons.length - 1; x >= 0; x--) {
            checkedbuttons[x].remove();
        }
    }

    showChecked() {
        todo.updateList();
        const checked = document.getElementsByClassName("notdone");

        for (let i = checked.length - 1; i >= 0; i--) {
            checked[i].remove();
        }
    }
}