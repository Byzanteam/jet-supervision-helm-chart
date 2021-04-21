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
make install

# (optional) set release-name
make install RELEASE=release-name
```
