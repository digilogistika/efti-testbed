<img alt="eFTI4ALL" height="35" src="https://efti4all.eu/wp-content/uploads/2024/11/eft4all-logo-color@2x-1.png"> &nbsp;&nbsp; <img alt="Digilogistika Keskus" height="40" src="https://dlk.ee/wp-content/uploads/2020/12/cropped-634328faa26e3f71d35b6651_DLKlogo-e1700323210714-1-250x61.png"> &nbsp;&nbsp; <img alt="Co-funded by EU" height="35" src="https://ec.europa.eu/regional_policy/images/information-sources/logo-download-center/eu_co_funded_en.jpg"> &nbsp;&nbsp; <img alt="eFTI4EU" height="35" src="https://efti4eu.eu/wp-content/uploads/2023/09/logo.png"> &nbsp;&nbsp; <img alt="eFTI4LIVE" height="35" src="https://efti4live.eu/wp-content/uploads/2025/11/EFTI4LIVE-logo-color_1@4x.png"> &nbsp;&nbsp; <img alt="Pikker Development" height="30" src="img/pikker_logo_black.png">

## Introduction

**eFTI TestBed** is a playground for eFTI project member states.
It provides an environment for testing implementations of eFTI Gate, Platform and Authority systems.
It was developed as part of the eFTI4ALL project.

The **eFTI TestBed** includes:
- **Gate** (with **Admin Panel**)
- **Demo Platform**
- **Demo Authority UI**

The **Gate** is compliant with the eFTI regulations and compatible with the [*reference implementation*](https://github.com/EFTI4EU/reference-implementation), although it does not use the *reference implementation* internally.

The **Demo Platform** a simplified eFTI platform interface that can upload identifiers to the **Gate** and respond to **Gate** requests. It is **not** a fully functioning *TMS system*.

The **Demo Authority UI** provides a simple user interface for creating eFTI competent authority requests. It does **not** include an authority application backend.

The **Admin Panel** is not an official part of the eFTI Gate, but it significantly simplifies usage and integration.
It provides visibility into the internal processes of the **Gate**.

The **eFTI TestBed** is available at: [https://eu-ee32.eftisandbox.eu/](https://eu-ee32.eftisandbox.eu/)

The **eu-ee32** public IP: 77.42.44.136

The **eu-ee31** public IP: 46.62.227.86

## Onboarding
Contact [support@dlk.ee](mailto:support@dlk.ee) to register your Gate, Platform or Authority in the **eFTI TestBed**.

After contacting the support email and expressing your intent to connect with the **eFTI TestBed**, you will receive credentials for a user account with access to the **Admin Panel**.

## Integrations
- [For Gates](#for-gates)
- [For Platforms](#for-platforms)
  - [REST API](#rest-api)
  - [eDelivery](#edelivery)
- [For Authorities](#for-authorities)

## For Gates
Since gates only communicate with each other through **eDelivery**, you must support the following eFTI messages via **eDelivery**:
- [*identifierQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/identifier-query.xml) and [*identifierResponse*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/identifier-response.xml)
- [*uilQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-query.xml) and [*uilResponse*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-response.xml)
- [*postFollowUpRequest*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/follow-up-request.xml)

The **Gate's** eDelivery endpoint is: `https://eu-ee32.eftisandbox.eu/services/msh`.

For eDelivery integration, both parties must exchange certificates.
Make sure your Gate's certificate is configured in the **Admin Panel**.
The certificate of the **eFTI TestBed Gate** is visible under the `This gate details` view.

After integration you are able to configure your gates and manage their users from the **Admin panel**. Additionally, you can make identifier and dataset queries from the **Demo Authority UI**.

Example **identifiers** to query: 006EST, 080EST

Example **UIL** to query dataset:
- **Gate ID**: EU-EE32
- **Platform ID**: demo
- **Dataset ID**: 9efaf791-3898-4062-9b9f-4efbc12501d6

## For Platforms
As a platform you have **two** ways to connect with the **eFTI TestBed**:
- [**REST API**](#rest-api)
- [**eDelivery**](#edelivery)

You can choose either approach, but we strongly recommend the **REST API** since it is (a lot) faster and easier to implement.
If needed, you can also use both.

Messages exchanged between the platform and the **Gate** must conform to the  [**eFTI schemas**](https://github.com/EFTI4EU/reference-implementation/tree/main/schema).

When a consignment is created on the platform, an **identifiers set** should be sent to the **Gate**.
The structure of the **identifier set** is defined in [this **XSD**](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/consignment-identifier.xsd).

When an authority queries a consignment through the **Gate**, the platform must respond with the consignment dataset based on the requested **subsets**.
The dataset structure and subset-dependent fields are defined in [this **XSD**](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/consignment-common.xsd).

**Subsets** can be thought of as access rights that define which data an authority is allowed to request.
For example, if an authority has subset `EU01`, it can only access the data fields defined for `EU01`.

After integration you are able to configure your platforms, manage their users and view consignments from the **Admin panel**. Furthermore, you can query identifiers and datasets from your platforms from the **Demo Authority UI**.

### REST API
For **REST API** integration, your platform must:
- Expose **two endpoints**
- Send **one request** to the **Gate**

The endpoints your platform must expose are documented in this [**OpenAPI** specification](https://demo-platform.eu-ee32.eftisandbox.eu/v1/openapi).

The **Gate** endpoint used by platforms is documented in this [**OpenAPI** specification](https://eu-ee32.eftisandbox.eu/v1/openapi) under the `For Platforms` section.

To verify that the Gate can reach your platform, a ping can be triggered via platform admin.

Authentication with REST API is done by using Basic token in the header of the request. 
Example of the Authorization header with email abc@example.com and pass 1234 construct the header like so:

```
Authorization: Basic base64Encode(abc@example.com:1234)
a.k.a
Authorization: Basic YWJjQGV4YW1wbGUuY29tOjEyMzQ=
```

### eDelivery
For **eDelivery** integration, your platform must implement an eDelivery endpoint capable of handling the following eFTI messages:
- [*uilQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-query.xml)
- [*postFollowUpRequest*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/follow-up-request.xml)

Additionally, the platform must send a [*saveIdentifiersRequest*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/save-identifiers.xml) to the **Gate's** eDelivery endpoint.

Because **eDelivery** is *asynchronous*, the platform must respond to a [*uilQuery*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-query.xml) with a corresponding [*uilResponse*](https://github.com/EFTI4EU/reference-implementation/blob/main/schema/xsd/examples/uil-response.xml).

The **Gate's** eDelivery endpoint is: `https://eu-ee32.eftisandbox.eu/services/msh`.

For eDelivery integration, both parties must exchange certificates.
Make sure your Gate's certificate is configured in the **Admin Panel**.
The certificate of the **eFTI TestBed Gate** is visible under the `This gate details` view.

## For Authorities
Authorities can integrate with the **Gate** using a simple **REST API**.
Other integration types are not currently planned for the **eFTI TestBed**.

The available authority endpoints are documented in this [**OpenAPI** specification](https://eu-ee32.eftisandbox.eu/v1/openapi) under the `For Authorities` section.

After integration you are able to configure your authorities and manage their users from the **Admin panel**. In addition, you can make identifier and dataset queries from the **Demo Authority UI**.


Example **identifiers** to query: 006EST, 080EST

Example **UIL** to query dataset:
- **Gate ID**: EU-EE32
- **Platform ID**: demo
- **Dataset ID**: 9efaf791-3898-4062-9b9f-4efbc12501d6
