const run = require('../repository/database');
const query = require('../repository/query');

exports.main = (req, res) =>{
    console.log('requisição')
    const data = req.query.data;

    if(data){
         if(data.match('^\\d{4}\\-(0[1-9]|1[012])\\-(0[1-9]|[12][0-9]|3[01])$')){
            Promise.resolve(run(query.setEmps,data)).then(result => {
                res.send(data)
            }).catch(err => {res.send(err)});
        }
             else res.send('Formato incorreto: ' + data);
    }else res.sendStatus(404);
}