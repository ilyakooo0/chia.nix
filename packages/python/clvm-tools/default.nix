{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  clvm,
  clvm-tools-rs,
  setuptools-scm,
  pytestCheckHook,
}:
buildPythonPackage rec {
  pname = "clvm_tools";
  version = "0.4.7";
  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "Chia-Network";
    repo = "clvm_tools";
    rev = version;
    hash = "sha256-+1D2GDlboAtkormlJ5owdxZVk+9ABaaS3UKPYgkCUc0=";
  };

  nativeBuildInputs = [
    setuptools-scm
  ];

  propagatedBuildInputs = [
    clvm
    clvm-tools-rs
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "clvm_tools"
  ];

  disabledTests = [
    "test_cmd_unknown-1_txt"
  ];

  # give a hint to setuptools-scm on package version
  SETUPTOOLS_SCM_PRETEND_VERSION = "v${version}";

  meta = with lib; {
    description = "Tools for clvm development";
    homepage = "https://www.chialisp.com/";
    license = licenses.asl20;
    maintainers = [];
  };
}
