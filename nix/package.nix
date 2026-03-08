{
  pkgs,
  package,
}: pkgs.writeShellApplication  {
name = "writer";
runtimeInputs = with pkgs; [
fd
git
pandoc
ripgrep
(texliveTeTeX.withPackages (ps: [ps.garamond-libre]))
];
text = ''
exec -a "$0" ${package}/bin/nvim "$@"
'';
}
