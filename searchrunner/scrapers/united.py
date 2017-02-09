from searchrunner.scrapers.common import Scraper


class UnitedScraper(Scraper):

    provider = "United"

    def load_results(self):
        self.load_fake_results(xrange(1, 1800))
