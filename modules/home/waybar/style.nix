{ ... }:
{
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: Source Code Pro;
      padding-right: 5px;
      padding-left: 5px;
    }
    window#waybar {
      background: #16191C;
      color: #AAB2BF;
    }
    #workspaces button {
      padding: 0 5px;
    }
  '';
}
