class Popso < Formula
  desc "Open-source LP, MILP, QP, MIQP, QCQP and SOCP solver"
  homepage "https://github.com/gozwei/popso"
  url "https://github.com/gozwei/popso/archive/refs/tags/v0.8.3.tar.gz"
  sha256 "2298306270b18b34e14ea18459d41a9d29490c7860c89bb8c5dd117a9570c7e3"
  license "Apache-2.0"
  head "https://github.com/gozwei/popso.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DPOPSO_BUILD_TESTS=OFF", "-DPOPSO_BUILD_SHARED=ON", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"t.lp").write <<~EOS
      Maximize
       obj: 3 x + 4 y
      Subject To
       c1: x + 2 y <= 14
       c2: 3 x - y >= 0
      Bounds
       x <= 10
      General
       x
      End
    EOS
    output = shell_output("#{bin}/popso #{testpath}/t.lp")
    assert_match "Status: OPTIMAL", output
    assert_match "Objective: 38", output
  end
end
