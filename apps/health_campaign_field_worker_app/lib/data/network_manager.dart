class NetworkManager {
  final NetworkManagerConfiguration configuration;

  const NetworkManager(this.configuration);
}

class NetworkManagerConfiguration {}

enum PersistenceConfiguration { offlineFirst, onlineOnly }
