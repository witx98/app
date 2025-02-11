package org.acme;

import picocli.CommandLine;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class AppVersionProvider implements CommandLine.IVersionProvider {
    @Override
    public String[] getVersion() throws Exception {

        InputStream resources = AppVersionProvider.class.getResourceAsStream("/version.txt");

        if (resources == null) {
            return new String[]{"Cloud not read version from version.txt!"};
        }

        StringBuilder sb = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(resources))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
        }

        return new String[]{sb.toString()};

    }
}
