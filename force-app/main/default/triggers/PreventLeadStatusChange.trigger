trigger PreventLeadStatusChange on Lead (before update) {
    for (Lead newLead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(newLead.Id);

        // Apply only for existing leads (update context)
        if (newLead.Status != oldLead.Status) {
            newLead.addError('You are not allowed to change the status.');
        }
    }
}