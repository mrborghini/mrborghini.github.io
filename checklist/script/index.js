console.log("            _                  _    _      _ \n" +
    "  _ __  _ _| |__  ___ _ _ __ _| |_ (_)_ _ (_)\n" +
    " | '  \\| '_| '_ \\/ _ \\ '_/ _` | ' \\| | ' \\| |\n" +
    " |_|_|_|_| |_.__/\\___/_| \\__, |_||_|_|_||_|_|\n" +
    "                         |___/               \n",
);

let todo = new ToDo();
let filter = new Filter();

filter.getFilter(todo);

todo.showToDo();