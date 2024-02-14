class Logger {
    #classname;

    constructor(classname) {
        this.#classname = classname;
    }

    logWithTime() {
        const date = new Date();
        const options = {
            year: 'numeric',
            month: 'numeric',
            day: 'numeric',
            hour: 'numeric',
            minute: '2-digit',
            second: '2-digit',
            hour12: false,
        };
        return date.toLocaleString(undefined, options);
    }

    warning(message) {
        this.log("WARNING", message);
    }

    error(message) {
        this.log("ERROR", message);
    }

    info(message) {
        this.log("INFO", message);
    }

    debug(message) {
        this.log("DEBUG", message);
    }

    log(level, message) {
        console.log(`[${this.logWithTime()}]: ${this.#classname} - ${level}: ${message}`);
    }
}