{{/*
Expand the name of the chart.
*/}}
{{- define "jet-supervision-helm-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jet-supervision-helm-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jet-supervision-helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jet-supervision-helm-chart.labels" -}}
helm.sh/chart: {{ include "jet-supervision-helm-chart.chart" . }}
{{ include "jet-supervision-helm-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jet-supervision-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jet-supervision-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return the proper image name
*/}}
{{- define "jet-supervision-helm-chart.image" }}
{{- $registryName := .Values.imageCredentials.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

{{/* Return the app path */}}
{{- define "jet-supervision-helm-chart.app-path" }}
{{- $subpath := default "/" .Values.subpath -}}
{{- $baseUrl := default "/" .Values.baseUrl -}}
{{- printf "%s/%s" $subpath $baseUrl | clean -}}
{{- end }}

{{/* Return the assets path */}}
{{- define "jet-supervision-helm-chart.assets-path" }}
{{- printf "/jet/supervision" | clean -}}
{{- end }}
