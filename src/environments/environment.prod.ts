declare global {
  interface Window {
    AppConfig: {
      baseURL: string;
    }
  }
}

export const environment = {
  production: true,
  baseURL: window.AppConfig.baseURL
};
