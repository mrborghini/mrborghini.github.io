class InputValidation {
    #logger;

    constructor() {
        this.#logger = new Logger("InputValidation");
    }

    verifyAddToDo() {
        let input = document.getElementById("inputTodo").value;
        const copyinput = input;
        if (input != null && input != "") {
            this.#logger.info("Task input verified");
            input = null;
            return copyinput;
        } else {
            this.#logger.warning("No input given");
            return "";
        }
    }

    verifyEditTodo(id) {
        let input = document.getElementById(`inputedit-${id}`).value;
        const copyinput = input;

        if (input != null && input != "") {
            this.#logger.info("Edit task input verified");
            input = null;
            return copyinput;
        } else {
            this.#logger.warning("No input given");
            return "";
        }
    }
}