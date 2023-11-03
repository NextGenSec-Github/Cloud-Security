# Zero Trust model on AWS 🚀

AWS believes that Zero Trust models move beyond traditional point-in-time network-centric controls in three meaningful ways. First, Zero Trust models integrate network and identity controls by augmenting the network boundary with identity-aware controls while simultaneously minimizing the network perimeter of individual service components. Second, Zero Trust models move to a continuous posture assessment model instead of a point-in-time trust decision. Third, good Zero Trust models provide prescriptive guidance while remaining flexible to the use case and security requirements. The models accomplish these by:

1️⃣ Decreasing the reliance on network location as a means of granting access, but not removing those controls entirely. Network-centric controls are paired with identity-centric controls, with each made aware of the other when making AuthN/AuthZ choices.

2️⃣ Leveraging identity controls to continuously authenticate and authorize each request instead of the traditional one-time upfront authentication and authorization scheme.

3️⃣ Allowing for flexibility in implementations, enabling you to work backward from your specific use cases. Providing robust user access to resources, reducing unnecessary pathways between workloads, and far-flung IoT solutions require different sets of resources to accomplish this joining of controls.

4️⃣ Balancing the implementation of controls with the organizational value of the systems and data being protected. In addition to upfront costs, Zero Trust models carry operational burdens and costs that might not be appropriate for certain data.

## HOW ARE THESE PRINCIPLES PUT INTO PRACTICE ON AWS? 🔍

Here are some tactical examples of how to put this into practice:

**Principle 1:** Use static permissions and user behavior analysis to authenticate and authorize each action, not just at the start of a “session”. For example, every AWS API call is a signed request that is individually authenticated and authorized.

**Principle 2:** Services to service communications should be consistent and follow best practices regardless of whether either party is another service or a human interface. Regardless of how tightly coupled services may be, they should use short-term credentials with API calls that are authenticated and authorized every single time. No more storing credentials in a “hidden” file.

**Principle 3:** Leverage scalable endpoints and network encryption over all communications channels. Regardless of whether IoT devices are talking over the Internet or a corporate network, encryption keeps the data safe.

**Principle 4:** Eliminate unnecessary pathways between resources. Consider each system component an independent system on an untrusted platform and design basic network controls to block unnecessary communication at the start.

**Principle 5:** When appropriate leverage gateways to manage communication between components. For example, using an API Gateway allows you to implement rate limiting, leverage AWS IAM or custom authorizers for AuthN and AuthZ, and can provide logging and metrics.

**Principle 6:** Enforce the right amount of security at the point of user access. Instead of placing the largest lock you can find on the house and leaving the rooms inside open, put the right-sized lock for each door depending on the value behind it. For example, leverage pixel proxies (such as Virtual Desktop Infrastructure or Application Streaming) for services with higher data risk, and identity-aware proxies for network access to less sensitive resources.

**Principle 7:** Identify all assets uniquely, provide the right permissions to devices themselves, and then maintain vigilance with monitoring and maintenance. Ensuring granular control over individual far-flung devices like IoT sensors or robots provides the ability to react to changes in device behavior and fix abnormal behavior before it becomes a problem. 🛡️🔒
