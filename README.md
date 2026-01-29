## Introduction
This is **eFTI TestBed** - a playground for eFTI project member states.
This is a place for testing implementations of eFTI gate, platform and authority systems.

eFTI TestBed provides the **Gate** (with **Admin Panel**), **Demo Platform** and **Demo Authority UI**.

The **Gate** is compliant with the eFTI regulations and compatible with the [*reference implementation*](https://github.com/EFTI4EU/reference-implementation) (though it is not using the *reference implementation*).
The **Demo Platform** is just a eFTI platform interface that can upload identifiers to the **Gate** and respond to Gate's requests - it is not a fully functioning *TMS system*.
The **Demo Authority UI** is a easy way to make eFTI competent authority's requests through a simple UI - there is not authority application backend.

The **Admin Panel** is not a official part of the eFTI gate, but it makes everything easier.
It provides a window to see what is going on inside the **Gate**.
This helps a lot with integration.

The **eFTI TestBed** is available here: [https://eu-ee32.eftisandbox.eu/](https://eu-ee32.eftisandbox.eu/)

## Onboarding
Contact [support@dlk.ee](mailto:support@dlk.ee) to get your gate/platform/authority registered in the **eFTI TestBed**.

After you have contacted with the [support mail](mailto:support@dlk.ee) that you want to connect with the **eFTI TestBed**, you will receive credentials for a user that can access the Admin Panel.

## Integrations
- [For Gates](#for-gates)
- [For Platforms](#for-platforms)
  - [REST API](#rest-api)
  - [eDelivery](#edelivery)
- [For Authorities](#for-authorities)

## For Gates
some text about eDelivery

## For Platforms
As a platform you have **two** ways to connect with the **eFTI TestBed**:
- [**REST API**](#rest-api)
- [**eDelivery**](#edelivery)

You can choose which every one is easier for you, but we strongly recommend the **REST API** since it is (a lot) faster and easier to implement.
If you really want you can of course use both as well.

The messages sent between platform and the **Gate** are according to the [**eFTI schemas**](https://github.com/EFTI4EU/reference-implementation/tree/main/schema).

When a consignment is created on the platform an identifiers set should be sent to the **Gate**. Here is [the **XSD**](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/consignment-identifier.xsd) that defines identifiers set.

When a consignment is queried by the authority through the **Gate** the platform has to respond with the consignment dataset (based on the **subsets**). Here is [the **XSD**](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/consignment-common.xsd) that defines consignment dataset and what fields should be included based on the **subsets**.

**Subsets** can be though of as rights that authorities have to ask some type of data.
For example if an authority has subset `EU01` then they can only access the data that is predefined to `EU01`.

### REST API
For **REST API** integration you need to implement **two endpoints** to your platform and a **single request** that is sent to the **Gate**.

The endpoints that platform should expose are visible in this [**OpenAPI** documentation](https://demo-platform.eu-ee32.eftisandbox.eu/v1/openapi).

The endpoint (on the **Gate**) where the platform should make the requests to is visible in this [**OpenAPI** documentation](https://eu-ee32.eftisandbox.eu/v1/openapi) under the `For Platforms` section.

### eDelivery
For **eDelivery** integration you need to implement an eDelivery endpoint that can handle **two different** eDelivery messages ([*uilQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-query.xml) and [*postFollowUpRequest*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/follow-up-request.xml)) and a request that is sent to the **Gate's** eDelivery endpoint ([*saveIdentifiersRequest*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/save-identifiers.xml)).
Since **eDelivery** is *asynchronous* you must answer to the [*uilQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-query.xml) with the [*uilResponse*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-response.xml) message.

**Gate's** eDelivery endpoint is `https://eu-ee32.eftisandbox.eu/services/msh`.

For eDelivery integration both sides also need the other's certificate, so make sure you put your platform's certificate in the **Admin Panel**.

## For Authorities
https://eu-ee32.eftisandbox.eu/v1/openapi - eFTI API (For Authorities section)
