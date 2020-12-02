import logging
import logging.handlers
import os
from enum import Enum
from appdirs import AppDirs

import pico.utils.constants as Constants


class Logger:
    LOG_LEVEL = 'INFO'
    LOG_FILE_PATH = Constants.LOG_FILE_PATH

    class Mode(Enum):
        INFO = 0
        DEBUG = 1

    @staticmethod
    def setLogMode(mode: Mode):
        if mode == Logger.Mode.INFO:
            Logger.LOG_LEVEL = 'INFO'
            Logger.LOG_FILE_PATH = Constants.LOG_FILE_PATH
        elif mode == Logger.Mode.DEBUG:
            dirs = AppDirs(Constants.APP_NAME)

            Logger.LOG_LEVEL = 'DEBUG'
            Logger.LOG_FILE_PATH = os.path.join(dirs.user_log_dir, 'pico.log')

            print("Debug mode enabled. Logging to `{}`".format(Logger.LOG_FILE_PATH))

    @staticmethod
    def getLogger(name):
        if not os.path.exists(os.path.dirname(Logger.LOG_FILE_PATH)):
            os.makedirs(os.path.dirname(Logger.LOG_FILE_PATH))

        # Logging settings
        formatter = logging.Formatter(
            fmt='%(asctime)s %(name)s [%(levelname)-8s] %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        handler = logging.handlers.RotatingFileHandler(Logger.LOG_FILE_PATH, maxBytes=1000*1000*10, backupCount=10)
        handler.setFormatter(formatter)
        screenHandler = logging.StreamHandler()
        screenHandler.setFormatter(formatter)
        logger = logging.getLogger(name)
        logger.setLevel(logging.getLevelName(Logger.LOG_LEVEL))

        logger.addHandler(handler)
        logger.addHandler(screenHandler)

        return logger