#!/usr/bin/env bash

# JENV
git clone https://github.com/gcuisinier/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

# JDK 11
yum install -y java-11-openjdk*
jenv add /usr/lib/jvm/java-11

# JDK 8
yum install -y java-1.8.0-openjdk*
jenv add /usr/lib/jvm/java-1.8.0
cp /usr/lib/jvm/java-1.8.0/jre/lib/security/policy/unlimited/*.jar /usr/lib/jvm/java-1.8.0/jre/lib/security/

# JDK 7
yum install -y java-1.7.0-openjdk*
jenv add /usr/lib/jvm/java-1.7.0
cp /usr/lib/jvm/java-1.7.0/jre/lib/security/policy/unlimited/*.jar /usr/lib/jvm/java-1.7.0/jre/lib/security/

# JDK 6
yum install -y java-1.6.0-openjdk*
jenv add /usr/lib/jvm/java-1.6.0

