# Generated with JReleaser 1.16.0 at 2025-02-05T21:28:49.96030669+01:00

class App < Formula
  desc "A CLI tool for changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  version "1.0.10"
  license "APACHE-2.0"


  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-linuxx64.zip"
    sha256 "65553290c123534b5eb905cbce10b9ef6c195e0c72c7966ebf61f36a9d67dc81"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "5f6583fb29c025806d6d5496cec360f3364c40ddb7764f7cb1f0967d1275b4e0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinx64.zip"
    sha256 "7cc67b0b4f7b90098c78e163bce03825f2edcc76e85fcb3586e951754a7265ad"
  end


  def install
    libexec.install Dir["*"]
    if OS.linux? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/app-linuxx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-linuxx64/app-#{version}-runner"
    elsif OS.mac? && Hardware::CPU.arm?
      chmod 0755, "#{libexec}/app-darwinarm64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-darwinx64/app-#{version}-runner"
    elsif OS.mac? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/app-darwinx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-darwinarm64/app-#{version}-runner"
    end
  end

  test do
    output = shell_output("#{bin}/app-#{version}-runner --version")
    assert_match "#{version}", output
  end
end
