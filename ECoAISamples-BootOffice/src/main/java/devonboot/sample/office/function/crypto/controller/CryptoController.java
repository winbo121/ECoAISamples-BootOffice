package devonboot.sample.office.function.crypto.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import devonboot.sample.office.function.crypto.model.Crypto;
import devonframe.security.crypto.CryptoManager;

@Controller
public class CryptoController {

    @Autowired
    @Qualifier("aesManager")
    CryptoManager aesManager;

    @Autowired
    @Qualifier("desManager")
    CryptoManager desManager;

    @Autowired
    @Qualifier("ariaManager")
    CryptoManager ariaManager;

    @RequestMapping(value = "/function/crypto/cryptoForm.do")
    public String idGenerationForm(ModelMap model) {

        model.addAttribute("cryptoText", "");
        model.addAttribute("crypto", new Crypto());

        return "function/crypto/employeeForm";
    }

    @RequestMapping(value = "/function/crypto/retrieveEcryption.do")
    public String retrieveEcryption(Crypto crypto, ModelMap model) throws UnsupportedEncodingException {

        String cryptoTest = crypto.getCryptoText();

        if (cryptoTest != null && !"".equals(cryptoTest)) {
            cryptoTest = cryptoTest.trim();

            crypto.setEcryptionAesText(aesManager.encrypt(cryptoTest));
            crypto.setEcryptionDesText(desManager.encrypt(cryptoTest));
            crypto.setEcryptionAriaText(ariaManager.encrypt(cryptoTest));
        }

        crypto.setDecryptionAesText("");
        crypto.setDecryptionDesText("");
        crypto.setDecryptionSeedText("");
        crypto.setDecryptionAriaText("");

        model.addAttribute("cryptoText", cryptoTest);
        model.addAttribute("crypto", crypto);

        return "function/crypto/employeeForm";
    }

    @RequestMapping(value = "/function/crypto/retrieveDecryption.do")
    public String retrieveDecryption(Crypto crypto, ModelMap model) {

        String cryptoTest = crypto.getCryptoText();
        if (cryptoTest != null && !"".equals(cryptoTest)) {
            cryptoTest = cryptoTest.trim();
        }

        String ecryptionAesText = crypto.getEcryptionAesText();
        String ecryptionDesText = crypto.getEcryptionDesText();
        String ecryptionAriaText = crypto.getEcryptionAriaText();

        if (ecryptionAesText != null) {
            crypto.setDecryptionAesText(aesManager.decrypt(ecryptionAesText));
        }
        if (ecryptionDesText != null) {
            crypto.setDecryptionDesText(desManager.decrypt(ecryptionDesText));
        }
        if (ecryptionAriaText != null) {
            crypto.setDecryptionAriaText(ariaManager.decrypt(ecryptionAriaText));
        }

        model.addAttribute("cryptoText", cryptoTest);
        model.addAttribute("crypto", crypto);

        return "function/crypto/employeeForm";
    }

}
