require('./scss/app.scss')

import defaultTranslations from "./i18n/it.yaml"; // embedded in the bundle
import "./i18n/en.yaml"; // just a reference so that webpack can imports the file in the build

import YAML from "yaml";
import { flatten } from "./utils"
import { Elm } from './elm/Pyxis.elm'

const defaultLocale = 'it';

function buildI18nDict(text) {
    try {
        const parsedObject = YAML.parse(text)
        return flatten(parsedObject);
    } catch (err) {
        console.error(err);
        return {} // TODO: improve error handling
    }
}

async function fetchLocale(locale) {
    try {
        const response = await fetch(`./i18n/${locale}.yaml`);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
        return await response.text();
    } catch (err) {
        console.error(`Can't load translations of '${locale}' locale. Falling back to locale '${defaultLocale}'`);
        return defaultTranslations;
    }
}

async function initI18n() {
    let lang = defaultLocale;
    let loadedText = defaultTranslations;
    const langMatch = location.href.match(/lang=(\w+)/);

    if (langMatch) {
        lang = langMatch[1];
    }

    if (lang !== defaultLocale) {
        loadedText = await fetchLocale(lang);
    }

    document.documentElement.lang = lang;

    return [lang, buildI18nDict(loadedText)];
}


initI18n().then(([lang, translations]) => {
    const app = Elm.Pyxis.init({
        node: document.getElementById('app'),
        flags: {
            currentPath: window.location.pathname,
            language: lang,
            translations: Object.entries(translations).filter((([k, v]) => v !== null))
        }
    });

    app.ports.copyToClipboard.subscribe(text => {
        const editor = document.createElement("textarea");
        document.body.appendChild(editor);
        editor.value = text;
        editor.select();
        editor.setSelectionRange(0, text.length);
        document.execCommand("copy");
        editor.remove();
    });
});
