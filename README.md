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
  repository: jet/jet-supervision-app
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

4. set actionList
```yaml
# values.local.yaml

# home.supervisions-未签收(database_list_rows)
SUPERVISION_ACTION_HOME_SUPERVISIONS_UNSIGNED=
# home.supervisions-即将逾期(database_list_rows)
SUPERVISION_ACTION_HOME_SUPERVISIONS_SOON_TO_DUE_REPORTING=
# home.supervisions-已逾期(database_list_rows)
SUPERVISION_ACTION_HOME_SUPERVISIONS_OVERDUE_REPORTING=
# home.assignments-未签收(database_list_rows)
SUPERVISION_ACTION_HOME_ASSIGNMENTS_UNSIGNED=
# home.assignments-即将逾期(database_list_rows)
SUPERVISION_ACTION_HOME_ASSIGNMENTS_SOON_TO_DUE_REPORTING=
# home.assignments-已逾期(database_list_rows)
SUPERVISION_ACTION_HOME_ASSIGNMENTS_OVERDUE_REPORTING=
# home.assignments-待汇报(database_list_rows)
SUPERVISION_ACTION_HOME_ASSIGNMENTS_WAITING_REPORTING=
# list_issue_categories-列出事项分类(database_list_rows)
SUPERVISION_ACTION_LIST_ISSUE_CATEGORIES_ALL=
# list_issues.supervisions-全部事项(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_ALL=
# list_issues.supervisions-未签收(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_UNSIGNED=
# list_issues.supervisions-即将逾期(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_SOON_TO_DUE_REPORTING=
# list_issues.supervisions-已逾期(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_OVERDUE_REPORTING=
# list_issues.supervisions-正常推进(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_PROMOTING=
# list_issues.supervisions-待汇报(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_WAITING_REPORTING=
# list_issues.supervisions-已完结事项(database_list_rows)
SUPERVISION_ACTION_ISSUES_SUPERVISIONS_COMPLETED=
# list_issues.assignments-我承办的(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_ALL=
# list_issues.assignments-协办事项(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_COLLABORATIONS=
# list_issues.assignments-未签收(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_UNSIGNED=
# list_issues.assignments-即将逾期(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_SOON_TO_DUE_REPORTING=
# list_issues.assignments-已逾期(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_OVERDUE_REPORTING=
# list_issues.assignments-正常推进(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_PROMOTING=
# list_issues.assignments-待汇报(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_WAITING_REPORTING=
# list_issues.assignments-已完结事项(database_list_rows)
SUPERVISION_ACTION_ISSUES_ASSIGNMENTS_COMPLETED=
# list_issues.filters-根据事项分类筛选出我负责的/协办的事项(database_list_rows)
SUPERVISION_ACTION_LIST_ISSUES_FILTERS_BY_CATEGORIES=
# issue_operations-创建事项(database_create_row)
SUPERVISION_ACTION_ISSUE_OPERATIONS_CREATE=
# issue_operations-完成事项(database_update_row)
SUPERVISION_ACTION_ISSUE_OPERATIONS_COMPLETE=
# issue_operations-事项详情.督办单位(database_load_row)
SUPERVISION_ACTION_ISSUE_OPERATIONS_LOAD_FOR_SUPERVISOR=
# issue_operations-事项详情.承办单位(database_load_row)
SUPERVISION_ACTION_ISSUE_OPERATIONS_LOAD_FOR_ASSIGNEE=
# issue_operations-事项详情.协办单位(database_load_row)
SUPERVISION_ACTION_ISSUE_OPERATIONS_LOAD_FOR_COLLABORATOR=
# issue_operations-督办单位修改详情(workflow_submit_form)
SUPERVISION_ACTION_ISSUE_OPERATIONS_UPDATE=
# issue_operations-签收事项(workflow_submit_form)
SUPERVISION_ACTION_ISSUE_OPERATIONS_SIGN=
# list_reporting_events-查看汇报列表.督办单位(database_list_rows)
SUPERVISION_ACTION_LIST_REPORTING_EVENTS_FOR_SUPERVISOR=
# list_reporting_events-查看汇报列表.承办单位(database_list_rows)
SUPERVISION_ACTION_LIST_REPORTING_EVENTS_FOR_ASSIGNEE=
# list_reporting_events-查看汇报列表.协办单位(database_list_rows)
SUPERVISION_ACTION_LIST_REPORTING_EVENTS_FOR_COLLABORATOR=
# list_signing_events-查看签收记录.督办单位(database_list_rows)
SUPERVISION_ACTION_LIST_SIGNING_EVENTS_FOR_SUPERVISOR=
# list_signing_events-查看签收记录.承办单位(database_list_rows)
SUPERVISION_ACTION_LIST_SIGNING_EVENTS_FOR_ASSIGNEE=
# list_signing_events-查看签收记录.协办单位(database_list_rows)
SUPERVISION_ACTION_LIST_SIGNING_EVENTS_FOR_COLLABORATOR=
# reporting_events_operations-汇报详情.督办单位(database_load_row)
SUPERVISION_ACTION_REPORTING_EVENTS_OPERATIONS_LOAD_FOR_SUPERVISOR=
# reporting_events_operations-汇报详情.承办单位(database_load_row)
SUPERVISION_ACTION_REPORTING_EVENTS_OPERATIONS_LOAD_FOR_ASSIGNEE=
# reporting_events_operations-汇报事项(workflow_submit_form)
SUPERVISION_ACTION_REPORTING_EVENTS_OPERATIONS_SUBMIT=
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
