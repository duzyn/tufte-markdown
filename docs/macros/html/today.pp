!comment(
// today
// Usage: !today
)

!define(today)(
!ifeq(!format)(html)(
!ifeq(!os)(windows)(
!powershell(Get-Date -Format yyyy-MM-dd)
)

!ifeq(!os)(darwin)(
!sh(date "+%Y-%m-%d")
)

!ifeq(!os)(linux)(
!sh(date "+%Y-%m-%d")
)
)

!ifeq(!format)(pdf)(
\today
)
)