import logging
import time

class log:
    error_pre = '\x1b[31;01m'
    info_pre = '\x1b[32;01m'
    warning_pre = '\x1b[33;01m'
    fatal_pre = '\x1b[31;31m'
    debug_pre = '\x1b[36;01m'
    reset = '\x1b[39;49;00m'
    _log = None
    all_loggers = []

    init = False

    @staticmethod
    def init_logging(name = "", level = None):
        if not log.init or level!= None:
            log._log = logging.getLogger()
            if level != None:
                log._log.setLevel(level)
            else:
                log._log.setLevel(logging.DEBUG)
            logging.addLevelName( logging.FATAL,   log.fatal_pre + logging.getLevelName(logging.FATAL)   + log.reset)
            logging.addLevelName( logging.ERROR,   log.error_pre + logging.getLevelName(logging.ERROR)   + log.reset)
            logging.addLevelName( logging.WARNING, log.warning_pre  + logging.getLevelName(logging.WARNING) + log.reset)
            logging.addLevelName( logging.INFO,    log.info_pre  + logging.getLevelName(logging.INFO)    + log.reset)
            logging.addLevelName( logging.DEBUG,   log.debug_pre + logging.getLevelName(logging.DEBUG)   + log.reset)

            logging.basicConfig(level=level,format='%(asctime)s (%(name)s) [%(levelname)s]: %(message)s', datefmt='%H:%M:%S')
            log.init = True

        logger = None
        if name != "":
            logger = logging.getLogger(name)    
            logger.setLevel(log._log.getEffectiveLevel())
            log.all_loggers.append(logger)

        return logger

    @staticmethod
    def set_level(level):
        if not log.init: 
            log.init_logging()
        if isinstance(level, str):
            verb_dict = {"WARNING":logging.WARNING, "INFO":logging.INFO, "DEBUG":logging.DEBUG, "ERROR":logging.ERROR}
            log._log.setLevel(verb_dict[level])
            for logger in log.all_loggers:
                logger.setLevel(verb_dict[level])
        else:
            log._log.setLevel(level)
            for logger in log.all_loggers:
                logger.setLevel(level)
    @staticmethod
    def warning(msg):
        if not log.init: log.init_logging()
        log._log.warning(msg)

    @staticmethod
    def debug(msg):
        if not log.init: log.init_logging()
        log._log.debug(msg)

    @staticmethod
    def error(msg):
        if not log.init: log.init_logging()
        log._log.error(msg)

    @staticmethod
    def info(msg):
        if not log.init: log.init_logging()
        log._log.info(msg)

    @staticmethod
    def fatal(msg):
        if not log.init: log.init_logging()
        log._log.info(msg)

    @staticmethod
    def log(level, msg):
        if not log.init: log.init_logging()
        log._log.log(level, msg)


class timer:
    last_tick = time.clock()
    @staticmethod
    def start(log_level = logging.INFO):
        log.log(log_level, "Starting clock.")
        timer.last_tick = time.clock()

    @staticmethod
    def stop(log_level = logging.INFO):
        log.log(log_level, "Total time taken: "+str(time.clock()-timer.last_tick)+" sec")
        timer.last_tick = time.clock()
