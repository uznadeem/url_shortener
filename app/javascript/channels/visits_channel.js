import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const visitCountElement = document.getElementById("visit-count");

  if (visitCountElement) {
    const alias = visitCountElement.getAttribute("data-alias");

    consumer.subscriptions.create({ channel: "VisitsChannel", alias: alias }, {
      connected() {
        console.log(`Connected to VisitsChannel for alias: ${alias}`);
      },

      disconnected() {
        console.log(`Disconnected from VisitsChannel for alias: ${alias}`);
      },

      received(data) {
        console.log("Received data:", data);
        visitCountElement.innerText = data.visits_count;
      }
    });
  }
});
