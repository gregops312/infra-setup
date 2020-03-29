import testinfra
import unittest
import warnings

class Test(unittest.TestCase):

    def setUp(self):
        warnings.simplefilter("ignore")
        self.host = testinfra.get_host("ansible://docker_server?ansible_inventory=./machines")

    def test_curl_is_installed(self):
        package = self.host.package("curl")
        self.assertTrue(package.is_installed)

# def test_gcc_is_installed(host):
#     package = host.package("gcc")
#     assert package.is_installed

# def test_git_is_installed(host):
#     package = host.package("git")
#     assert package.is_installed

# def test_htop_is_installed(host):
#     package = host.package("htop")
#     assert package.is_installed

# def test_make_is_installed(host):
#     package = host.package("make")
#     assert package.is_installed

# def test_ncdu_is_installed(host):
#     package = host.package("ncdu")
#     assert package.is_installed

# def test_net_tools_is_installed(host):
#     package = host.package("net-tools")
#     assert package.is_installed

# def test_python_is_installed(host):
#     package = host.package("python")
#     assert package.is_installed

# def test_python3_is_installed(host):
#     package = host.package("python3.6")
#     assert package.is_installed

# def test_ssh_is_installed(host):
#     package = host.package("ssh")
#     assert package.is_installed

# def test_tmux_is_installed(host):
#     package = host.package("tmux")
#     assert package.is_installed

# def test_tree_is_installed(host):
#     package = host.package("tree")
#     assert package.is_installed

# def test_vim_is_installed(host):
#     package = host.package("vim")
#     assert package.is_installed

# def test_wget_is_installed(host):
#     package = host.package("wget")
#     assert package.is_installed

# def test_xclip_is_installed(host):
#     package = host.package("xclip")
#     assert package.is_installed

# def test_zsh_is_installed(host):
#     package = host.package("zsh")
#     assert package.is_installed

if __name__ == "__main__":
    unittest.main()
