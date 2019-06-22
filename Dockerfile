FROM ruby:2.5
ARG USERID
ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile $APP_ROOT/Gemfile
RUN cd $APP_ROOT \
    && useradd -m --uid $USERID app \
    && bundle install \
    && chown -R app:app $APP_ROOT
