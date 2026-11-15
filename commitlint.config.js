/**
 * Reglas de commits (Conventional Commits en español), las mismas que entiende semantic-release.
 * Se validan en tu PC con .husky/commit-msg y en el CI sobre los commits del PR.
 *
 *   tipo(ámbito): descripción
 *
 *   feat -> sube MINOR   fix -> sube PATCH   feat! o BREAKING CHANGE -> sube MAJOR
 *   docs, style, refactor, perf, test, build, ci, chore, revert -> no publican versión
 *
 * Pie propio del proyecto (cambios pedidos respecto al híbrido):  Cambio-pedido: CHG-01
 */
export default {
  extends: ['@commitlint/config-conventional'],
  helpUrl: 'https://www.conventionalcommits.org/es/v1.0.0/',
  rules: {
    'type-enum': [2, 'always', ['feat', 'fix', 'refactor', 'perf', 'docs', 'style', 'test', 'build', 'ci', 'chore', 'revert']],
    'scope-case': [2, 'always', 'kebab-case'],
    'header-max-length': [2, 'always', 100],
    'subject-case': [0],
    'body-max-line-length': [0],
    'footer-max-line-length': [0],
  },
};
