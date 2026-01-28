## Introduction
This is eFTI testbed - a playground for eFTI project member states.
This is a place for testing implementations of eFTI gate, platform and authority systems.

eFTI TestBed provides the Gate (with Admin Panel), Demo Platform and Demo Authority UI.
The TestBed Gate is compliant with the eFTI regulations and compatible with the [reference implementation](https://github.com/EFTI4EU/reference-implementation) (though it is not using the reference implementation).
The Demo Platform is just a eFTI platform interface that can upload identifiers to the Gate and respond to Gate's requests - it is not a fully functioning TMS system.
The Demo Authority UI is a easy way to make eFTI competent authority's requests through a simple UI - there is not authority application backend.

The Admin Panel is not a official part of the eFTI system, but it makes everything easier.
It provides a window to see what is going on inside the eFTI Gate.
This helps a lot with integration.

The eFTI TestBed is available here: [https://eu-ee32.eftisandbox.eu/](https://eu-ee32.eftisandbox.eu/)

## Onboarding
Contact [support@dlk.ee](mailto:support@dlk.ee) to get your gate/platform/authority registered in the TestBed.

After you have contacted with the [support mail](mailto:support@dlk.ee) that you want to connect with the TestBed, you will receive credentials for a user that can access the Admin Panel.

## Integrations

- [For Gates](#for-gates)
- [For Platforms](#for-platforms)
  - [REST API](#rest-api)
  - [eDelivery](#edelivery)
- [For Authorities](#for-authorities)


## For Gates
some text about eDelivery

## For Platforms
As a platform you have **two** ways to connect with the TestBed:
- eDelivery
- REST API

You can choose which every one is easier for you, but we strongly recommend the **REST API** since it is (a lot) faster and easier to implement.
In you really want you can of course use both as well.

### REST API
https://eu-ee32.eftisandbox.eu/v1/openapi - eFTI API (For Platforms section)
https://demo-platform.eu-ee32.eftisandbox.eu/v1/openapi - Platform own API
### eDelivery

## For Authorities
https://eu-ee32.eftisandbox.eu/v1/openapi - eFTI API (For Authorities section)
