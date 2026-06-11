---
name: "pbp-membership-change"
description: "Use for PBP platform membership changes involving auto-renewal, cancellation, prorations, payment retry, billing state, plan rules, or membership lifecycle specs."
---

# PBP Membership Change

Use this skill for membership domain work in the PBP platform.

## Start

1. Identify the membership lifecycle transition and owning model/service.
2. Inspect nearby membership specs and factories before editing.
3. Check timezone, billing period, facility, and payment gateway interactions.
4. Prefer focused local specs. Do not use Blacksmith/Testbox unless explicitly requested.

## Domain Rules

- Treat membership state transitions as durable business contracts.
- Be explicit about cancellation timing: immediate, end-of-period, scheduled, or failed-payment driven.
- Preserve auto-renewal behavior and retry semantics unless the request changes them.
- Check prorations, credits, refunds, and invoices when plan timing changes.
- Use `Time.current` and facility-aware timezone behavior where time matters.
- Keep payment side effects idempotent.

## Behavior Map

Cover meaningful paths:

- Active membership success path.
- Cancellation path.
- Renewal or non-renewal path.
- Failed payment or retry path.
- Plan change or proration path when touched.
- Facility or tenant-scope boundary.
- Time boundary around period start/end.

## Validation

Typical focused checks:

```bash
bundle exec rspec spec/models/membership_plan_spec.rb
bundle exec rspec spec/services/memberships/<path>
bundle exec rspec <changed-spec>
```

Add adjacent service/model specs when a lifecycle transition crosses billing, jobs, or gateway code.

## Output

Report:

- Lifecycle behavior changed.
- Billing/timezone assumptions.
- Payment side effects.
- Validation command and result.
- Remaining edge cases.

