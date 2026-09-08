# New Beta XSD schemas

We use the **Semantic** version as it provides a more precise validation.

## Defined eDelivery messages

* FTI004UploadIdentifierRequest -> FTI029UploadIdentifierResponse
* FTI009GetCmdsRequest -> FTI010GetCmdsResponse
* FTI019SearchIdentifierRequest -> FTI021SearchIdentifierResponse
* FTI025LodgeFollowUpCommRequest -> FTI030LodgeFollowUpCommResponse

Each `FTI*` message folder contains a generated `sample.xml`.

## Notes/Issues

* UniqueIDSetUIL renamed to UniqueIDSetUniqueIDSet - why? Is it a typo?
* FTI025/ReferencedID should allow UUID, but length fixed to 17 chars
