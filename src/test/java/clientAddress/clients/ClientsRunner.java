package clientAddress.clients;

import com.intuit.karate.junit5.Karate;

public class ClientsRunner {
  @Karate.Test
  Karate testClients() {
    return Karate.run("clients").relativeTo(getClass());
  }

}
