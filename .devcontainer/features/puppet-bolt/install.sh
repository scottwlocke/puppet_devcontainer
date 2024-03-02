
# apt-get wget 
wget https://apt.puppet.com/puppet-tools-release-jammy.deb
dpkg -i puppet-tools-release-jammy.deb
wget https://apt.puppet.com/puppet7-release-jammy.deb
sudo dpkg -i puppet7-release-jammy.deb
apt-get update
apt-get install puppet-agent puppet-bolt pdk

apt-get autoremove -y && \
rm -rf /var/lib/apt/lists/*
rm ./puppet-tools-release-jammy.deb
rm ./puppet7-release-jammy.deb

# Install OnceOver
set +x

pdk_ruby_bindir="$(dirname "$(ls -dr /opt/puppetlabs/pdk/private/ruby/*/bin/gem | head -1)")"

"${pdk_ruby_bindir}/gem" install --no-document onceover
ln -s "${pdk_ruby_bindir}/onceover" /usr/local/bin/onceover