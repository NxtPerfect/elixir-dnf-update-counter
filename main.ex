defmodule Main do
  def check_update do
    { version, _exit_code } = System.cmd("cat", ["/etc/fedora-release"])
    [ _, _, version, _ ] = String.split(version, " ") 
    IO.puts version
    { output, _exit_code } = System.cmd("dnf", ["check-update"])
    [_, packages ] = String.split(output, ~r/Last metadata expiration check:.+\\n/)
    if String.contains?(output, "RPM Fusion for Fedora #{version} - Nonfree - Updates\n") do
      [ _, packages ] = String.split(output, "RPM Fusion for Fedora #{version} - Nonfree - Updates\n")
    end
    IO.puts packages
    # IO.puts "Number of packages is #{packages}"
    # After RPM Fusion for Fedora (number) - Nonfree - Updates
    # new empty line
    # Then there are packages
  end
end

Main.check_update()
