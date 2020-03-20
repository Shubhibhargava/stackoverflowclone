<template>
    <div class="main row">
        <div class="info col-md-4">
            <h2>Join the Stack Overflow</h2><h2>community</h2>
            <p><svg width="26" height="26" class="svg-icon mtn2" fill="#0AA8DC"><path opacity=".5" d="M4.2 4H22a2 2 0 012 2v11.8a3 3 0 002-2.8V5a3 3 0 00-3-3H7a3 3 0 00-2.8 2z"></path><path d="M1 7c0-1.1.9-2 2-2h18a2 2 0 012 2v12a2 2 0 01-2 2h-2v5l-5-5H3a2 2 0 01-2-2V7zm10.6 11.3c.7 0 1.2-.5 1.2-1.2s-.5-1.2-1.2-1.2c-.6 0-1.2.4-1.2 1.2 0 .7.5 1.1 1.2 1.2zm2.2-5.4l1-.9c.3-.4.4-.9.4-1.4 0-1-.3-1.7-1-2.2-.6-.5-1.4-.7-2.4-.7-.8 0-1.4.2-2 .5-.7.5-1 1.4-1 2.8h1.9v-.1c0-.4 0-.7.2-1 .2-.4.5-.6 1-.6s.8.1 1 .4a1.3 1.3 0 010 1.8l-.4.3-1.4 1.3c-.3.4-.4 1-.4 1.6 0 0 0 .2.2.2h1.5c.2 0 .2-.1.2-.2l.1-.7.5-.7.6-.4z"></path></svg>
            <span>Get unstuck — ask a question</span></p>
            <p><svg width="26" height="26" class="svg-icon mtn2" fill="#0AA8DC"><path d="M12 .7a2 2 0 013 0l8.5 9.6a1 1 0 01-.7 1.7H4.2a1 1 0 01-.7-1.7L12 .7z"></path><path opacity=".5" d="M20.6 16H6.4l7.1 8 7-8zM15 25.3a2 2 0 01-3 0l-8.5-9.6a1 1 0 01.7-1.7h18.6a1 1 0 01.7 1.7L15 25.3z"></path></svg>
            <span>Unlock new privileges like voting and commenting</span></p>
            <p><svg width="26" height="26" class="svg-icon mtn2" fill="#0AA8DC"><path d="M14.8 3a2 2 0 00-1.4.6l-10 10a2 2 0 000 2.8l8.2 8.2c.8.8 2 .8 2.8 0l10-10c.4-.4.6-.9.6-1.4V5a2 2 0 00-2-2h-8.2zm5.2 7a2 2 0 110-4 2 2 0 010 4z"></path><path opacity=".5" d="M13 0a2 2 0 00-1.4.6l-10 10a2 2 0 000 2.8c.1-.2.3-.6.6-.8l10-10a2 2 0 011.4-.6h9.6a2 2 0 00-2-2H13z"></path></svg>
            <span>Save your favorite tags, filters, and jobs</span></p>
            <p><svg width="26" height="26" class="svg-icon mtn2" fill="#0AA8DC"><path d="M21 4V2H5v2H1v5c0 2 2 4 4 4v1c0 2.5 3 4 7 4v3H7s-1.2 2.3-1.2 3h14.4c0-.6-1.2-3-1.2-3h-5v-3c4 0 7-1.5 7-4v-1c2 0 4-2 4-4V4h-4zM5 11c-1 0-2-1-2-2V6h2v5zm11.5 2.7l-3.5-2-3.5 1.9L11 9.8 7.2 7.5h4.4L13 3.8l1.4 3.7h4L15.3 10l1.4 3.7h-.1zM23 9c0 1-1 2-2 2V6h2v3z"></path></svg>
            <span>Earn reputation and badges</span></p>
        </div>
        <div class="card shadow p-3 mb-5 bg-white rounded login col-md-4">
        <div class="alert alert-danger" v-if="error && !success">
            <p>Unable to complete registration.Enter valid values</p>
        </div>
        <!-- <div class="alert alert-success" v-if="success">
            <p>Registration completed. You can now <router-link :to="{name:'login'}">sign in.</router-link></p>
        </div> -->
        <form autocomplete="off" @submit.prevent="register" v-if="!success" method="post">
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.name }">
                <label for="name">Display name</label>
                <input type="text" id="name" class="form-control" v-model="name" >
                <span class="help-block" v-if="error && errors.name">{{ errors.name }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.email }">
                <label for="email">E-mail</label>
                <input type="email" id="email" class="form-control"  v-model="email" >
                <span class="help-block" v-if="error && errors.email">{{ errors.email }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.password }">
                <label for="password">Password</label>
                <input type="password" id="password" class="form-control" v-model="password" >
                <p class="pass">Passwords must contain at least eight characters, including at least 1 letter and 1 number.</p>
                <span class="help-block" v-if="error && errors.password">{{ errors.password }}</span>
            </div>
             <div class="form-group" v-bind:class="{ 'has-error': error && errors.password }">
                        <label for="password_confirmation">Confirm Password</label>
                        <input type="password" id="password_confirmation" class="form-control" v-model="password_confirmation">
                    </div>
            <button type="submit" class="btn btn-primary submit">Sign up</button><p></p><p></p>
            <p class="pass">By clicking “Sign up”, you agree to our terms of service, privacy policy and cookie policy</p>
        </form>
        </div>
         <div class="signup">
        <p>Already have an account?&nbsp;<router-link :to="{ name: 'login' }"><span>Log in</span></router-link></p>
    </div>
    </div>
</template>
<style scoped>
.main{
    position: relative;
}
.login{
    width: 20%;
    margin-left: 55%;
    margin-top: 5%;
    position: absolute;
}
label{
    font-weight: bold;
    font-size: 115%;
   
}
.submit{
    width: 100%;
}
.info{
    position: absolute;
    width: 30%;
    margin-left: 25%;
    margin-top: 8%;
}
.pass{
    color: gray;
    font-size: 85%;
}
.signup{
    position: absolute;
    margin-top: 55%;
    margin-left: 58%;
}
.signup span{
    color: #0B7BA0;
}
</style>
<script> 
    export default {
        data(){
            return {
                name: '',
                email: '',
                password: '',
                password_confirmation: '',
                error: false,
                errors: {},
                success: false
            };
        },
        methods: {
            register(){
                var app = this
                this.$auth.register({
                    data: {
                        name: app.name,
                        email: app.email,
                        password: app.password,
                        password_confirmation: app.password_confirmation
                    }, 
                    success: function () {
                        app.success = true
                        const redirectTo = 'login'
            this.$router.push({name: redirectTo})
                    },
                    error: function (resp) {
                        app.error = true;
                        app.errors = resp.response.data.errors;
                    },
                    redirect: null
                });                
            }
        }
    }
</script>