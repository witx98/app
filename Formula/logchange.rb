# Generated with JReleaser 1.16.0 at 2025-02-05T21:28:49.96030669+01:00

class Logchange < Formula
  desc "A CLI tool for changelogs"
  homepage "https://github.com/logchange/logchange"
  version "1.16.7"
  license "Apache-2.0"


  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-linuxx64.zip"
    sha256 "409df1a137ee2461ec8636d2377e64478df6fa3b53bc85c942ce7bcf3852a031"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-darwinarm64.zip"
    sha256 "5f6583fb29c025806d6d5496cec360f3364c40ddb7764f7cb1f0967d1275b4e0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/logchange/logchange/releases/download/#{version}/logchange-darwinx64.zip"
    sha256 "7cc67b0b4f7b90098c78e163bce03825f2edcc76e85fcb3586e951754a7265ad"
  end


  def install
    libexec.install Dir["*"]
    if OS.linux? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/logchange-linuxx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-linuxx64/logchange"
    elsif OS.mac? && Hardware::CPU.arm?
      chmod 0755, "#{libexec}/logchange-darwinarm64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinx64/logchange"
    elsif OS.mac? && Hardware::CPU.intel?
      chmod 0755, "#{libexec}/logchange-darwinx64/logchange"
      bin.write_exec_script "#{libexec}/logchange-darwinarm64/logchange"
    end
  end

  test do
    output = shell_output("#{bin}/logchange --version")
    assert_match "#{version}", output
  end
end
