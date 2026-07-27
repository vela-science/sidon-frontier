forbid (
    principal,
    action == Action::"automatic_permit",
    resource
) unless {
    context.structuralValid
};

permit (
    principal,
    action == Action::"automatic_permit",
    resource
) when {
    ["receipt_computational"].contains(context.claimClass) &&
    !context.hasUnknownFields &&
    context.assuranceLevel >= 2 &&
    context.changedFindings <= 1 &&
    context.downstreamDependents <= 0 &&
    context.credentialValid &&
    !context.governanceMutation &&
    !context.targetContested &&
    context.methodIntegritySound &&
    context.executionBindingPresent &&
    context.executionBindingValid &&
    ["sha256:bfa12fbedb3cd6ce0faf854ed1e506bb52b739ba2b1f03207567d33ef1f43b15"].contains(context.packetRoot) &&
    ["sha256:75ad68706fd74650b6d82c2820dc9aae78d20995e7d89b0045519383bbb4ed92"].contains(context.profileRoot) &&
    ["sha256:7641fdaf11a3ad0c4110ade53b7d905c1ce1dae5a16234ed0d4e8d1dc79f548c"].contains(context.verifierCapsuleRoot) &&
    ["sha256:092c30d5309701b6e2bd61c37b6c47f6a9abfcb768a326d06ba85aabf10dc6ca"].contains(context.resultContractRoot) &&
    context.replayability == "exact"
};

permit (
    principal == Human::"local:device-sha256:67fbb8e56377e6868e9f941524e0bf39cfb4fd2a4bfdd25c2edb93fc82f86213|uid:501",
    action in [
        Action::"authority_initialize",
        Action::"authority_model_migrate",
        Action::"authority_rotate",
        Action::"authority_close",
        Action::"policy_rotate",
        Action::"review_accept",
        Action::"review_reject"
    ],
    resource
) when {
    context.exact &&
    !context.authentication.recovery_recent
};

permit(principal, action == Action::"work_claim", resource)
when {
    context.exact &&
    context.authentication.method == "agent_event_signature" &&
    context.authentication.assurance == "single_factor"
};

permit(principal, action == Action::"submission_register", resource)
when {
    context.exact &&
    context.authentication.method == "agent_record_signature" &&
    context.authentication.assurance == "single_factor"
};

permit(principal, action == Action::"verification_import", resource)
when {
    context.exact &&
    context.authentication.method == "agent_record_signature" &&
    context.authentication.assurance == "single_factor"
};
