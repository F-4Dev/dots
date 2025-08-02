cat ~/.config/matugen/glance/colors.yml > ~/.config/matugen/glance/glance.yml && \
cat ~/.config/matugen/glance/glance-base.yml >> ~/.config/matugen/glance/glance.yml && \
scp ~/.config/matugen/glance/glance.yml f4@192.168.178.48:/home/f4/glance/config/glance.yml