import unittest
import sys

import logging
import log_indented

logger = logging.getLogger(__name__)
logger.level = logging.DEBUG
# stream_handler = logging.StreamHandler(sys.stdout)
# logger.addHandler(stream_handler)


class TestLogIndented(unittest.TestCase):
    def setUp(self):
        self.stream_handler = logging.StreamHandler(sys.stdout)
        logger.addHandler(self.stream_handler)

    def tearDown(self):
        logger.removeHandler(self.stream_handler)

    @log_indented.logged(logger)
    def f_duck(self):
        log_indented.log_info("duck")
        # pylint: disable=redundant-unittest-assert
        self.assertTrue(True)


    @log_indented.logged(logger)
    def f_chicken(self):
        # logger.info("chicken")
        log_indented.log_info("chicken")
        self.f_duck()
        # pylint: disable=redundant-unittest-assert
        self.assertTrue(True)

    def test_basic2(self):
        logger.info("")
        self.f_chicken()
