package org.acme;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

@Command(name = "greeting", versionProvider = AppVersionProvider.class, mixinStandardHelpOptions = true)
public class GreetingCommand implements Runnable {

    @Parameters(paramLabel = "<name>", defaultValue = "picocli",
            description = "Your name.")
    String name;

    @Override
    public void run() {
        System.out.printf("Hello %s, go go commando!\n", name);
    }

}
