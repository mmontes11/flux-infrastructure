{{- define "tenant.name" -}}
{{- $name := default .Release.Name .Values.nameOverride }}
{{- printf "flux-tenant-%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "namespace.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}