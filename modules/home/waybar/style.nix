{ ... }:
{
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-size: 22px;
      font-family: Source Code Pro;
      padding-right: 10px;
      padding-left: 10px;
    }
    window#waybar {
      background: #16191C;
      color: #AAB2BF;
    }
    #workspaces button {
      padding: 0 10px;
    }
  '';
}
