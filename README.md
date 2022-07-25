# NgDockerizedProd

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 14.1.0.


## Dockerize and K8S
We have 2 versions: root vs rootless image

### Rancher Desktop
Homepage: https://rancherdesktop.io/

By default, RD will mount the **home directory**. (E.g /User/tiep), therefore to build the image, you need to clone the repo to **home directory**.

To build image:

```sh
nerdctl --namespace k8s.io build -f Dockerfile.rootless -t spa-app:v1.0 . 
```

To run RD k8s:
```sh
kubectl apply -f k8s/app.yaml
```

Open your browser at http://localhost:8080

### Docker compose

To building and running the project:

- Rootless:
```sh
docker-compose -f docker-compose-rootless.yml up -d --build
```

- or Root version:

```sh
docker-compose up -d --build  
```

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
