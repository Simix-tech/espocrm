/************************************************************************
 * This file is part of EspoCRM.
 *
 * EspoCRM - Open Source CRM application.
 * Copyright (C) 2014-2023 Yurii Kuznietsov, Taras Machyshyn, Oleksii Avramenko
 * Website: https://www.espocrm.com
 *
 * EspoCRM is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * EspoCRM is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with EspoCRM. If not, see http://www.gnu.org/licenses/.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "EspoCRM" word.
 ************************************************************************/

let scriptEl = document.createElement('script');

scriptEl.setAttribute('type', 'application/json');
scriptEl.setAttribute('data-name', 'loader-params');
scriptEl.textContent = JSON.stringify({
    basePath: '../../',
    libsConfig: {
        "espo": {
            "exportsTo": "window",
            "exportsAs": "Espo"
        },
        "jquery": {
            "expose": true,
            "exposeAs": "$"
        },
        "backbone": {
            "exportsTo": "window",
            "exportsAs": "Backbone"
        },
        "bullbone": {
            "expose": true,
            "exposeAs": "Bull"
        },
        "handlebars": {
            "expose": true,
            "exposeAs": "Handlebars"
        },
        "underscore": {
            "expose": true,
            "exposeAs": "_"
        },
        "marked": {},
        "dompurify": {
            "expose": true,
            "exposeAs": "DOMPurify"
        },
        "js-base64": {
            "exportsTo": "window",
            "exportsAs": "Base64"
        },
        "moment": {
            "exportsTo": "window",
            "exportsAs": "moment"
        }
    },
    aliasMap: {
        "jquery": "lib!jquery",
        "underscore": "lib!underscore",
        "cronstrue": "lib!cronstrue",
        "exif-js": "lib!exif-js",
        "moment": "lib!moment",
        "js-base64": "lib!base64",
        "bullbone": "lib!bullbone",
        "backbone": "lib!backbone"
    }
});

document.head.appendChild(scriptEl);
