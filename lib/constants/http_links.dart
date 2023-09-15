const String baseUrl = 'https://talebadmin.perla-tech.com';

const String registerUrl = '/test/register';
const String loginUrl = '/test/log_in';

String token = '';

void setToken(String newToken) => token = newToken;

Uri registerUri = Uri.parse('$baseUrl$registerUrl');
Uri loginUri = Uri.parse('$baseUrl$loginUrl');
