import json
import logging

import requests
from wiremock.constants import Config
from wiremock.server import WireMockServer

from config.config import BASE_URL_WIREMOCK
from utils.logger import get_logger
from utils.rest_client import RestClient
from utils.singleton import Singleton
from utils.validate_response import ValidateResponse

LOGGER = get_logger(__name__, logging.DEBUG)


class WiremockStub(metaclass=Singleton):
    def create_stub(self):
        """

        :return:
        """
        session = requests.Session()
        with WireMockServer() as wiremock:
            file_name = "/home/berserker/PycharmProjects/bdd_auto/input_data/projects_mock_get_200.json"
            stub_data =  ValidateResponse().get_input_data_from_json(file_name)
            Config.base_url = f"{BASE_URL_WIREMOCK}:{wiremock.port}/__admin"
            url_mapping = f"{BASE_URL_WIREMOCK}:{wiremock.port}/__admin/mappings"

            response = RestClient().send_request(method_name="post", session=session, url=url_mapping, data=json.dumps(stub_data))

            LOGGER.debug("Response content: %s", response)


if __name__ == '__main__':
    wire = WiremockStub()
    wire.create_stub()
