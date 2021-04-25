# Supervision App (jet-app)

## Installation
### make `action-list.env`
```bash
cp action-list.example.env action-list.env
```

Modify `action-list.env` as needed.

### make `values.local.yaml`
1. set imageCredentials for image pulling
```yaml
# values.local.yaml
imageCredentials:
  registry: registry.cn-hangzhou.aliyuncs.com
  username: deploy-man@skylark
  password: changeit
```

2. set image info for image pulling
```yaml
# values.local.yaml

image:
  repository: jet-app/supervision-gxzh
  tag: "latest"
  pullPolicy: IfNotPresent
```

3. set host and environments for supervision
```yaml
# values.local.yaml

# Application
supervisionHost: supervision.jet.localhost

# Frontend environments
baseUrl: /
sentryDsn: ""
jetHost: workflow.jet.work
jetSSL: true

```

### make install
```bash
# set release-name in `.env` file

# .env
RELEASE=gxzh

make install
```

```bash
# set release-name
make install RELEASE=gxzh
```

## HowTo

### Setup TLS
```yaml
# values.local.yaml

supervisionTLSSecret:
  certificate: base64 encoded certificate-file
  key: base64 encoded key-file
```
