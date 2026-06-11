---
name: "pbp-multi-tenancy-check"
description: "Use for PBP platform facility, organization, tenant-scope, authorization leakage, cross-tenant query, export, worker, or API data isolation risks."
---

# PBP Multi-Tenancy Check

Use this skill when a change can expose or mutate data across facilities, organizations, users, or tenant boundaries.

## Start

1. Identify the tenant boundary: facility, organization, facility group, user link, or whitelabel context.
2. Trace the query from entry point to final records.
3. Check authorization policy and data scope separately.
4. Prefer executable proof with allowed and denied tenants.

## Risk Patterns

- Query starts scoped but later joins or plucks unscoped ids.
- Background job receives an id and reloads without tenant context.
- Export/report uses broader relation than the UI.
- GraphQL resolver or field bypasses controller authorization assumptions.
- Cache key omits tenant context.
- Admin/global role path leaks into facility-scoped behavior.
- Facility group or organization scope is confused with facility scope.

## Validation Workflow

1. Build two tenants with similar records.
2. Prove allowed tenant can see or mutate only its records.
3. Prove denied/other tenant cannot see or mutate records.
4. Check exports, async jobs, and API responses if they use separate query paths.
5. Assert both returned data and side effects.

## Fix Rules

- Scope as early as possible and preserve scope through joins and service calls.
- Prefer policy/query object fixes over ad hoc filtering in presentation code.
- Do not rely on UI-hidden controls as authorization.
- Keep system/admin exceptions explicit and covered.

## Output

Report:

- Tenant boundary.
- Allowed and denied evidence.
- Scope fix if any.
- Validation command and result.
- Any remaining path not proven.

