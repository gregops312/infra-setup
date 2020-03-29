import testinfra
import unittest
import warnings

class Test(unittest.TestCase):

    def setUp(self):
        warnings.simplefilter("ignore")
        self.host = testinfra.get_host("ansible://docker_server?ansible_inventory=./machines")

    def test_apt_transport_https_is_installed(self):
        package = self.host.package("apt-transport-https")
        self.assertTrue(package.is_installed)

    def test_ca_certificates_is_installed(self):
        package = self.host.package("ca-certificates")
        self.assertTrue(package.is_installed)

    def test_software_properties_common_is_installed(self):
        package = self.host.package("software-properties-common")
        self.assertTrue(package.is_installed)

    def test_docker_ce_installed(self):
        package = self.host.package("docker-ce")
        self.assertTrue(package.is_installed)

if __name__ == "__main__":
    unittest.main()