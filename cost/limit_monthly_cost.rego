package terraform

import input.tfrun as tfrun


deny[reason] {
    cost = tfrun.cost_estimate.proposed_monthly_cost
    cost > 700
    reason := sprintf("Plan is too expensive: $%.2f, while up to $700 is allowed", [cost])
}
