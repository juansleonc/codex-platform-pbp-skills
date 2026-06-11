---
name: "pbp-payment-safety"
description: "Use for PBP platform payment gateway, PCI, sandbox, payment trace, retry, idempotency, refund, membership billing, or external gateway consistency changes."
---

# PBP Payment Safety

Use this skill for payment-related changes in the PBP platform.

## Start

1. Identify the gateway, payment object, order/reservation/membership path, and external boundary.
2. Inspect existing gateway patterns before adding behavior.
3. Preserve `Current.payment_trace_id` observability when relevant.
4. Use sandbox/test credentials only.
5. Prefer local focused specs. Do not hit live payment services unless explicitly requested and approved by the environment.

## Safety Rules

- Never log full card data, CVV, raw tokens, secrets, or sensitive gateway payloads.
- Keep idempotency explicit for charge, refund, retry, webhook, and async paths.
- Preserve consistent gateway interfaces and error handling.
- Treat retries as potentially duplicating money movement unless idempotency proves otherwise.
- Verify both success and decline/error paths.
- Keep PCI-sensitive data out of fixtures, docs, logs, and screenshots.

## Behavior Map

Cover the relevant paths:

- Successful charge or authorization.
- Decline, timeout, gateway error, and validation failure.
- Retry behavior.
- Duplicate request/idempotency behavior.
- Refund or void when touched.
- Webhook authenticity and replay behavior when touched.
- Membership/reservation side effects when payments drive state.

## Validation

Use focused specs around the payment boundary:

```bash
bundle exec rspec <payment-or-gateway-spec>
```

For gateway consistency, compare sibling gateway implementations before accepting a one-off branch.

## Output

Report:

- Money movement path touched.
- Gateway boundary and idempotency handling.
- Sensitive data/logging review.
- Validation command and result.
- Any sandbox/manual check still needed.

