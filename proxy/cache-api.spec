Name:           cache-api
Version:        1.0
Release:        1%{?dist}
Summary:        Cache API service with Redis/Valkey

License:        MIT
BuildArch:      noarch

Requires:       python3
Requires:       python3-pip
Requires(post): systemd
Requires(preun): systemd
Requires(postun): systemd

Source0:        cache-api-1.0.tar.gz

%description
Cache API service using Redis/Valkey and backend API.

%prep
%setup -q

%build

%install

mkdir -p %{buildroot}/usr/lib/cache-api
mkdir -p %{buildroot}/etc/cache-api
mkdir -p %{buildroot}/usr/lib/systemd/system

cp cache-api.py %{buildroot}/usr/lib/cache-api/
cp config-api.yaml %{buildroot}/etc/cache-api/
cp cache-api.service %{buildroot}/usr/lib/systemd/system/
cp requirements.txt %{buildroot}/usr/lib/cache-api/

%files

/usr/lib/cache-api/cache-api.py
/usr/lib/cache-api/requirements.txt
/etc/cache-api/config-api.yaml
/usr/lib/systemd/system/cache-api.service

%post

pip3 install -r /usr/lib/cache-api/requirements.txt

systemctl daemon-reload

%preun
if [ $1 -eq 0 ]; then
    systemctl stop cache-api
    systemctl disable cache-api
fi

%postun
systemctl daemon-reload

%changelog
* Wed Mar 11 2026 Chaotica <chaotica.rei@gmail.com> - 1.0
- Initial package with pip dependencies
