# Supervision App (jet-app)

## Installation
### make `action-list.env`
```bash
cp action-list.example.env action-list.env
```

Modify `action-list.env` as needed.

### make `values.local.yaml`
```yaml
# values.local.yaml

image:
  registry: registry.ap-northeast-1.aliyuncs.com
  repository: jet-app/supervision-gxzh
  tag: "latest"
  imagePullSecrets: []
  pullPolicy: IfNotPresent

# Application
supervisionHost: supervision.jet.localhost
supervisionTLSSecret:

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
